*** Settings ***
Resource  resource.robot
Test Setup  Input New Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  kalle  kalle123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  kalle123
    Input New Command
    Input Credentials  kalle  kalle123
    Output Should Contain  Username already taken

Register With Too Short Username And Valid Password
    Input Credentials  ka  kalle123
    Output Should Contain  Username too short

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  k@lle  kalle123
    Output Should Contain  Username should only contain characters from a to z

Register With Valid Username And Too Short Password
    Input Credentials  kalle  kalle12
    Output Should Contain  Password too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  kalle  kalleyks
    Output Should Contain  Password should contain at least one non-letter character