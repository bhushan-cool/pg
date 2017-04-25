f1=open('log1','r')
p=f1.read()
print "Contents of saved logfile are:"
print p
f1.close()

f1=open('log2','r')
p=f1.read()
print "Content of current log file are:"
print p
f1.close()


f1=open('log1','r')
f2=open('log2','r')
a=f1.readlines()
b=f2.readlines()

if a==b:
	print "All users are autherized"
else:
	print "Someusers are unautherized"
print "Unautherized users are:"

for j in range(0,len(b),1):
	fl=0
	for i in range(0,len(a),1):
		if a[i]==b[j]:
			fl=1
			x=i

	if fl==0:
		print b[j]
f1.close()
f2.close()

f1=open('traffic','r')
p=f1.read()
print "Traffic over network is:"
print p
f1.close()


