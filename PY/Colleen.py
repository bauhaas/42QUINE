#comment

def func():
  pass

def main():
  #comment in main
  x = '#comment\n\ndef func():\n  pass\n\ndef main():\n  #comment in main\n  x = %r\n  print(x %% x)\n\nmain()'
  print(x % x)

main()
