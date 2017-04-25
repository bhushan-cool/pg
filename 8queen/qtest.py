import json

board=[]
size=8


def danger(row,col):
	for (i,j) in board:
		if row==i: return True
		if col==j: return True
		if abs(row-i)==abs(col-j): return True
	return False


def placeq(row):
	if row>size:
		print board
	else:
		for col in range(1,size+1):
			if not danger(row,col):
				board.append((row,col))
				placeq(row+1)
				board.remove((row,col))
f=open('input.json')
data=json.load(f)

board.append((1, data["start"]))
placeq(2)
