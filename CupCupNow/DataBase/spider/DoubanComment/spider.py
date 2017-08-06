# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from pageAnalyesDemo import *
import urllib2
import json
URL='https://movie.douban.com/j/new_search_subjects?sort=T&range=0,10&tags=%E5%89%A7%E6%83%85&start=0'

tags = ["剧情","爱情","喜剧","科幻","动作","悬疑","犯罪","恐怖","青春","励志","战争","文艺","黑色","幽默","传记","情色","暴力","音乐","家庭"]
for tag in tags:
    print tag
    URL = 'https://movie.douban.com/j/new_search_subjects?sort=T&range=0,10&tags='+tag+'&start='
    for i in range(100):
        try:
            print i*20
            URL += str(i*20)
            request = urllib2.Request(url=URL)
            response = urllib2.urlopen(request, timeout=20)
            result = response.read()
            jsonObj  = json.loads( result)
            # URL, directors, rate, title, casts, cover
            for movie in jsonObj["data"]:
                pageAna(movie["url"],movie["title"])
        except Exception, e:
                print "The server couldn't fulfill the request"

