FUNC = lambda: [(f.write(STR % STR), f.close()) for f in [open("Grace_kid.py", mode="w")]]
STR = 'FUNC = lambda: [(f.write(STR %% STR), f.close()) for f in [open("Grace_kid.py", mode="w")]]\nSTR = %r\n\n#Execute code\nFUNC()'

#Execute code
FUNC()