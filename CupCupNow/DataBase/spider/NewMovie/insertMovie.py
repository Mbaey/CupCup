# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import json
import datetime
import urllib2
import MySQLdb
import MySQLdb.cursors

db = MySQLdb.connect(host='127.0.0.1', user='root', passwd='root', db='test', port=3306, charset='utf8', cursorclass = MySQLdb.cursors.DictCursor)
db.autocommit(True)
cursor = db.cursor()
def insertData(m_id , title, englishName, cover,boxOffice , type, date, timelen):
    sql ='insert into movie (m_id, title, englishName, cover, boxOffice, type, date, timelen) values (%s, %s, %s, %s, %s, %s, %s, %s)'
    cursor.execute(sql,( m_id, title, englishName, cover,boxOffice, type, date, timelen))
    print 'success'
    # cursor.close()
    # db.close()
    # 不关了