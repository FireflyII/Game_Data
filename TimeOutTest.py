import io,os,sys

#Scan files in a directory to pick out ones that timed out.

dr = sys.argv[1]

#Get the directory list, then narrow it down to ones with timestamps
#(as identified by the string of numbers at the end of the filename)
#in order to differentiate comment files from logged data.
filelist = os.listdir(dr)
loglist = []
for i in filelist:
    if i[len(i)-8:-4].isdigit():
        loglist.append(i)

#Go through the list of logs, open each file and scan for "Timed Out" in it.
#For all such files, rename it by appending "TO" to the end, so that the data
#is still there if we want to look at it later, but it won't be included when
#running the analyzer script.

for log in loglist:
    a = open(dr+"/"+log,'r')
    b = a.read().splitlines()
    for line in b:
        if "Timed Out" in line:
            os.rename(dr+"/"+log,dr+"/"+log[:-4]+"TO.txt")
            break
        
