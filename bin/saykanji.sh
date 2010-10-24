# saykanji by zariganitosh (http://d.hatena.ne.jp/zariganitosh/20090520/1242797422)
saykanji()
{
  wakati_yomi=`echo $1|/opt/local/bin/mecab -O wakati -d /opt/local/lib/mecab/dic/ipadic-utf8 |/opt/local/bin/mecab -O yomi -d /opt/local/lib/mecab/dic/ipadic-utf8 |sed -e 's/ ハ / ワ /g'`
  result=''
  for word in $wakati_yomi
  do
    if echo $word|grep -iq '[a-z]'
    then
      yomi=`grep -i "\"$word\"" ~/Downloads/カタカナ英語辞書10.6/カタカナ英語辞書10.6.txt|head -1|cut -d',' -f1`
      if [ -n "$yomi" ]
      then
        word="$yomi"
      fi
    fi
    result="${result}${word}"
  done
  /usr/local/bin/saykana $result
}
