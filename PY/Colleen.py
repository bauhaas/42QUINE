#comment

def func():
  pass

def main():
  #comment in main
  x = '#comment\n\ndef func():\n  pass\n\ndef main():\n  #comment in main\n  x = %r\n  print(x %% x)\n\nif __name__ == "__main__":\n  main()'
  print(x % x)

if __name__ == "__main__":
  main()
