# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from insertMovie import *
from bs4 import BeautifulSoup
import urllib2
import json
import time

# URL1= 'http://www.cbooo.cn/BoxOffice/GetHourBoxOffice?d='
URL1= 'http://www.cbooo.cn/Mdata/getMdata_movie?area=1&type=0&year=2017&initial=%E5%85%A8%E9%83%A8&pIndex='
URL2= 'http://www.cbooo.cn/m/'
for i in range(6,22):
    url = URL1+str(i)
    request = urllib2.Request(url)
    response = urllib2.urlopen(request, timeout=20)
    result = response.read()
    jsonObj  = json.loads(result)
    # url_ = jsonObj["data"][0]["url"]

    for hotMovie in jsonObj['pData']:
        print hotMovie['MovieName']
        try:
            url = URL2 + hotMovie['ID']
            request = urllib2.Request(url)
            response = urllib2.urlopen(request, timeout=20)
            result = response.read()

            soup = BeautifulSoup(result, "html.parser")

            #找到具体信息
            info = soup.find_all(attrs={"class": "ziliaofr"})
            soup = BeautifulSoup(str(info[0]), "html.parser")

            x = soup.find_all('p')
            # jsonObj  = json.loads( result)
            # url_ = jsonObj["data"][0]["url"]
            # URL, directors, rate, title, casts, cover
            # insertData(hotMovie['Irank'], hotMovie['mId'], hotMovie['MovieName'], hotMovie['BoxOffice'], hotMovie['sumBoxOffice'],hotMovie['movieDay'], hotMovie['boxPer'], imgUrl + hotMovie['MovieImg'])
            insertData(int(hotMovie['ID']) , hotMovie['MovieName'], hotMovie['MovieEnName'], hotMovie['defaultImage'],hotMovie['BoxOffice'] , x[2].get_text(), x[4].get_text(), x[3].get_text())
        except urllib2.URLError, e:
                print "The server couldn't fulfill the json request"

