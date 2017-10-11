# Find Button Presses in Pilot Data

import io,os,sys,json,csv

filetouse = '/Volumes/TarDisk-128/Game_Data/Game_Data/anon_datalogs/_Bj6P1vPsOuPe1507074822088.txt'

a = open(filetouse,'r')
b = a.read().splitlines()
b.remove('')
dicts = []
for R in b:
	d = json.loads(R)
	for i in d:
		dicts.append({'x':i.get("x"),'y':i.get("y"),'time':i.get("time"),'keys':i.get("keys")})

# dicts should now be a list containing dictionary objects for each time stamp,
# in effect representing each row of the eventual csv file.

pressed = [0,0,0,0,0,0,0,0]

#Test Each Button...

for i in dicts:
    x = i['x']
    y = i['y']
    #pressed=[0,0,0,0,0,0,0,0]
    if x>=288 and x<=304 and y>=255 and y<=271:
        pressed[0]=1
    elif x>=554 and x<=570 and y>=31 and y<=47:
        pressed[1]=1
    elif x>=331 and x<=347 and y>=34 and y<=50:
        pressed[2]=1
    elif x>=38 and x<=54 and y>=581 and y<=597:
        pressed[3]=1
    elif x>=3 and x<=19 and y>=389 and y<=405:
        pressed[4]=1
    elif x>=37 and x<=53 and y>=287 and y<=303:
        pressed[5]=1
    elif x>=501 and x<=517 and y>=265 and y<=281:
        pressed[6]=1
    elif x>=326 and x<=342 and y>=581 and y<=597:
        pressed[7]=1
    i['pressed']=pressed[:]
    i['sofar']=sum(pressed)

fieldnames = ['x','y','time','keys','pressed','sofar']

outfile = '/Volumes/TarDisk-128/Game_Data/Game_Data/newone.csv'

with open(outfile,'a') as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    for i in dicts:
        writer.writerow(i)
    
