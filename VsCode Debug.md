
# Python
[reference](https://www.zhihu.com/question/50700473)
## lauch.json

change the first part as following:

```python
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
```
Here, I use the pythonpath of my virtualenv.

## task.json
shift+command+b，任务运行程序选择others，修改配置类似如下:
```json
{
            "version": "0.1.0",
            "command" : "python",
            "isShellCommand" : true,
            "showOutput": "always",
}
```
