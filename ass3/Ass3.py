from Crypto.Random import random
from Crypto.PublicKey import DSA
from Crypto.Hash import SHA

message = raw_input("Enter your message:");
key = DSA.generate(1024)

print "\nParameter Tuple"
print key

h = SHA.new(message).digest()
print "\nMessage Digest"
print h

k = random.StrongRandom().randint(1,key.q-1)
print "\nLong Term Key Pair"
print k

sig = key.sign(h,k)
print "\nSignature Generation"
print sig

if key.verify(h,sig):
    print "\n"
    print "Verified.."
    print "Signature is correct"
else:
    print "Incorrect signature"
