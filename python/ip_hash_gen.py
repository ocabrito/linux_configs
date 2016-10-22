import hashlib
for a in range(0,255):
  for b in range(0,255):
    for c in range(0,255):
      for d in range(0,255):
        ip = str(a)+"."+str(b)+"."+str(c)+"."+str(d)
        ip_hash = hashlib.md5(ip).hexdigest()
        print ip+" -> "+ip_hash[-12:]
