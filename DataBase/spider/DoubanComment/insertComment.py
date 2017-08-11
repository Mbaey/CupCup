# coding: UTF-8
import sys
reload(sys)
sys.setdefaultencoding('utf8')

import json
import datetime
import MySQLdb
import MySQLdb.cursors
db = MySQLdb.connect(host='127.0.0.1', user='root', passwd='root', db='test', port=3306, charset='utf8', cursorclass = MySQLdb.cursors.DictCursor)
db.autocommit(True)
cursor = db.cursor()
def insertData(title, s_name, s_comment,l_title, l_comment, l_name, s_time, l_time):

    # (null, 'bb', 'aaaaaa',?, null )

    sqls = "insert into comment (c_content, u_name, m_title, timestamp) values (%s, %s, %s, %s)"
    sqll = "insert into comment (c_title, c_content, u_name, m_title, timestamp) values (%s, %s, %s, %s, %s)"
    for i in range(len(s_name)):
        cursor.execute(sqls, (s_comment[i], s_name[i],  title,  s_time[i] ))
        print '1'
    for i in range(len(s_name)):
        cursor.execute(sqll, (l_title[i], l_comment[i], l_name[i],  title,  l_time[i] ))
        print '2'
