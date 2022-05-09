from subprocess import call

def main():
  i = 5
  if i <= 0:
    return
  j = i - 1
  str = 'from subprocess import call\n\ndef main():\n  i = %d\n  if i <= 0:\n    return\n  j = i - 1\n  str = %r\n  with open("Sully_%%d.py" %% j, "w") as f:\n    f.write(str %% (i - 1, str))\n  call(["python3.7", "Sully_%%d.py" %% j])\n\nmain()'
  with open("Sully_%d.py" % j, "w") as f:
    f.write(str % (i - 1, str))
  call(["python3.7", "Sully_%d.py" % j])

main()