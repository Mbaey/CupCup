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

