# notes

'''
- in python 2 there are two sequences of characters: str and unicode
- the concepts of bytes only exist in python 3 so if you want to convert a bytes into unicode, if you have encode(`utf-8`)

with open ("file", "w") as f:
    f.write(os.urandom(10))

this will give an error in Python 3 since the read and write operations are default to `utf-8` and expects sequence of
characters containing unicode characters not bytes(containing binary data). If you want to make this work if you have to
specify that you are working with `wb` read and write in bytes(binary data) not str or unicode

'''
