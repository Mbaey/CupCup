__author__ = 'administrator'
# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

from bs4 import BeautifulSoup
import json
import urllib2

from douban import *
def pageAna(tag, URL, directors, rate, title, casts, cover):
    request = urllib2.Request(URL)

    #     URL += str(i*20)
    try:
        response = urllib2.urlopen(request, timeout=20)
        result = response.read()

        soup = BeautifulSoup(result, "html.parser")
        summary = soup.find_all(attrs={"property": "v:summary"})
        summary = summary[0].get_text()

        #当时学的时候还不知道
        #info = soup.select('#info')
        #直接返回的就是一个beautifulsoup的对象啊。。。
        #info = html.select('#info')[0]
		#info = info.get_text().split('\n')

		# 提取字段，只要冒号后面的文本内容
		#director = info[1].split(':')[-1].strip()
		#composer = info[2].split(':')[-1].strip()
		#actor = info[3].split(':')[-1].strip()
		#category = info[4].split(':')[-1].strip()
		#district = info[6].split(':')[-1].strip()
		#language = info[7].split(':')[-1].strip()
		#showtime = info[8].split(':')[-1].strip()
		#length = info[9].split(':')[-1].strip()
		#othername = info[10].split(':')[-1].strip()
        
        info = soup.find_all(id='info')
        soup = BeautifulSoup(str(info[0]), "html.parser")
        adaptor = soup.find_all(attrs={"class": "attrs"})
        adaptor =  adaptor[1].get_text()

        date = soup.find_all(attrs={"property": "v:initialReleaseDate"})
        date = date[0].get_text()

        timelen = soup.find_all(attrs={"property": "v:runtime"})
        timelen = timelen[0].get_text()
        insertData(directors, rate, title, casts, cover,adaptor, tag, date, timelen, summary)
    except Exception, e:
        print "The server couldn't fulfill the page request"

