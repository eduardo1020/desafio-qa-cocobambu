*** Settings ***
Resource     ../main.robot

*** Variables ***
&{general}
...    URL_COCOBAMBU=https://app.cocobambu.com/entrar?backPage=on-boarding%2Fdelivery%3FnextPage%3D%252Fdelivery
...    URL_INBOX=https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=16&ct=1694542838&rver=7.0.6738.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fnlp%3d1%26cobrandid%3dab0455a0-8d03-46b9-b18b-df2f57b9e44c%26RpsCsrfState%3d14f054e5-c25d-666c-2191-80f2577d4eb3&id=292841&aadredir=1&whr=outlook.com&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=ab0455a0-8d03-46b9-b18b-df2f57b9e44c
...    Browser=chrome
