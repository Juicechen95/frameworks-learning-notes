# Jupyter notebook

Requirement:  Internet

Set up: [Mac](http://jupyter-notebook.readthedocs.io/en/stable/public_server.html)

ssh -N -f -L localhost:8889:localhost:9452 jcz@202.120.37.223 -p 10122

ps aux | grep 9452

ssh jcz@202.120.37.127

nohup jupyter notebook &

ssh jcz@lingzhitec123456.hicp.net -p1022

## rcir
202.120.37.223:10132

# MobaXterm

Requirement:  local area network

# Microsoft Remote Desktop Client (for Windows, Mac OS, iOS and Android).

for remote computer, install [xrdp](https://github.com/neutrinolabs/xrdp);，install [mate](https://jingyan.baidu.com/article/642c9d340aacfa644a46f73c.html) 桌面;  [edit/etc/X11/](http://c-nergy.be/blog/?p=10752)(http://c-nergy.be/blog/?p=11043)

echo mate-session > .xsession
sudo service xrdp restart

for local computer, install Microsoft Remote Desktop app.
