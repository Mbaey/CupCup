__author__ = 'administrator'
# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')
from insertComment import *
from bs4 import BeautifulSoup
import urllib2


def pageAna(url, m_title):
    # url = 'https://movie.douban.com/subject/1292052/'
    try:
        request = urllib2.Request(url)
        response = urllib2.urlopen(request, timeout=20)
        result = response.read()
        # m_title = soup.find_all(attrs={"property": "v:itemreviewed"})[0].get_text()
        s_name = []
        s_comments = []
        s_time = []

        soup = BeautifulSoup(result, "html.parser")
        commentsInfo = soup.find_all(attrs={"class": "comment"})
        for comment in commentsInfo:
            t = BeautifulSoup(str(comment), "html.parser")
            s_comments.append(t.find_all('p')[0].get_text())
            s_name.append(t.find_all('a')[1].get_text())
            s_time.append(t.find_all(attrs={"class": "comment-time"})[0]['title'])

        l_comment= []
        l_name= []
        l_title= []
        l_time=[]
        #长评论
        #进入url
        info = soup.find_all(attrs={'class':'reviews mod movie-content'})
        soup = BeautifulSoup(str(info[0]), "html.parser")
        h3 = soup.find_all('h3')

        for h in h3:
            url = h.a['href']
            try:
                request = urllib2.Request(url)
                response = urllib2.urlopen(request, timeout=20)
                result = response.read()
                soup = BeautifulSoup(result, "html.parser")
                title = soup.find_all(attrs={"property": "v:summary"})[0].get_text()
                l_title.append(title)
                name = soup.find_all(attrs={"property": "v:reviewer"})[0].get_text()
                l_name.append(name)
                comment = soup.find_all(attrs={"property": "v:description"})[0].get_text()
                l_comment.append(comment)
                time = soup.find_all(attrs={"property": "v:dtreviewed"})[0].get_text()
                l_time.append(time)

            except urllib2.URLError, e:
                    print "The server couldn't fulfill the longComment request"
        insertData(m_title, s_name, s_comments, l_title, l_comment, l_name, s_time, l_time)
    except urllib2.URLError, e:
        print "The server couldn't fulfill the details request"
