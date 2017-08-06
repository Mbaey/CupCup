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
def insertData(directors, rate, title, casts, cover,adaptor, type, date, timelen, summary):

    # (null, 'bb', 'aaaaaa',?, null )

    sql ='insert into movie ( director, rate,title, casts, cover, adaptor, type, date, timelen, summary) values ( %s, %s, %s, %s,%s, %s, %s, %s, %s, %s)'
    cursor.execute(sql,( directors, rate, title, casts, cover,adaptor, type, date, timelen, summary))
    print 'success'
    # cursor.close()
    # db.close()
    # 不关了