
# Python
-lauch.json

change the first part as following:

'''
"version": "0.2.0",
    "configurations": [
        {
            "name": "Python",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "stopOnEntry" : true,
            "pythonPath" : "~/Venv/deepwalk/bin/python",
            "debugOptions" : [
                "RedirectOutput"
            ],

        },
       
       ......
   '''
