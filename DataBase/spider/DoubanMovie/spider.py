# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from pageAnalyes import *
import urllib2
import json
# URL='https://movie.douban.com/j/new_search_subjects?sort=T&range=0,10&tags=%E5%89%A7%E6%83%85&start=0'
# URL2 ='https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=20&page_start=0'
tags2 = ["热门", "最新"]
tags = ["剧情","爱情","喜剧","科幻","动作","悬疑","犯罪","恐怖","青春","励志","战争","文艺","黑色","幽默","传记","情色","暴力","音乐","家庭"]
for tag in tags:
    print tag
    URL = 'https://movie.douban.com/j/new_search_subjects?sort=T&range=0,10&tags='+tag+'&start='
    for i in range(5):
        try:
            URL +=  str(i*20)
            print i*20
            request = urllib2.Request(URL)
            response = urllib2.urlopen(request, timeout=10)
            result = response.read()
            jsonObj  = json.loads( result)
            # url_ = jsonObj["data"][0]["url"]
            # URL, directors, rate, title, casts, cover
            for movie in jsonObj["data"]:
                casts = ''
                for cast in movie["casts"]:
                    casts += cast + ' '

                directors = ''
                for director in movie["directors"]:
                    directors += director +  ' '
                pageAna(tag, movie["url"],directors,movie["rate"],movie["title"],casts,movie["cover"])
        except Exception, e:
                print "The server couldn't fulfill the json request"

