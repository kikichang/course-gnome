#Yu-chi (Kiki) Chang; Eric Chiang
''' 
This script would read in pdf files listed in cList.txt, parse all relevant information, and output to evaldb.sql.
The course evaluation pdf files can be found under /pdf
To run, type 

python writedb.py > evaldb.sql

Here we use Python 2.7

'''


import PyPDF2
from random import *

def getCourseList(filename):
	cList = []
	with open(filename) as fh:
		f = fh.readlines()

	for i in f:
		fname = i.rstrip()
		#fname = "'" + i.rstrip() + "'"
		cList.append(fname)
	return cList


def getText(pdffilename, ct):
	pdffilename = '../pdfs/' + pdffilename
	o = open(pdffilename, 'rb')
	reader = PyPDF2.PdfFileReader(o)
	text = reader.getPage(0) 
	textp = text.extractText()
	#return textp
	fname = 'workfile' + str(ct) + '.txt'
	f = open(fname,'w') 
	f.write(textp)
	f.close()


def getText2(pdffilename, ct):
	pdffilename = '../pdfs/' + pdffilename
	o = open(pdffilename, 'rb')
	reader = PyPDF2.PdfFileReader(o)
	text = reader.getPage(2) 
	textp = text.extractText()
	#return textp
	fname = 'workfile' + str(ct) + '-2.txt'
	f = open(fname,'w') 
	f.write(textp)
	f.close()

def getData(ct):
	fname = 'workfile' + str(ct) + '.txt'
	#with open('workfile.txt') as fh:
	with open(fname) as fh:
		s = fh.readlines()
		return s

def getData2(ct):
	fname = 'workfile' + str(ct) + '-2.txt'
	#with open('workfile.txt') as fh:
	with open(fname) as fh:
		s = fh.readlines()
		return s

def getCourseInformation(l):
	courseIDs = []
	courseSections = []
	courseSems = []
	courseYears = []
	courseNames = []
	courseInstructorN = []
	courseSchools = []
	courseDpts = []
	courseNums =[]
	
	iDept = {} #dict of instructorName: dept
	j = 0
	for i in l:
		courseIDs.append('"' + i[0:10] + '"')
		courseSections.append(i[11:13])
		if i[14:16] == "FA":
			courseSems.append('"' + "Fall" + '"')
			#courseSems.append('"' +i[14:16] + '"')
		elif i[14:16] == "SP":
			courseSems.append('"' + "Spring" + '"')
		elif i[14:16] == "SU":
			courseSems.append('"' + "Summer" + '"')
		courseYears.append('20' + i[16:18])
		courseSchools.append('"' + i[0:2] + '"')
		courseDpts.append(i[3:6])
		courseNums.append(i[7:10])
		s = i.split("_")
		first = s[0].split(".")
		courseNames.append(first[4:])
		second = s[1].split(".")
		instructorN = courseTexts[j][139].rstrip() #instructor name
		courseInstructorN.append(instructorN) #courseInstructorN.append(second[0])
		j += 1
		if instructorN not in iDept:
			iDept[instructorN] = i[3:6]
	return courseIDs, courseYears, courseSems, courseInstructorN, courseSections, courseSchools, courseDpts, courseNums, iDept

def getInstructorIDs():
	iDict = {} # name: ID
	for j in courseInstructorN:
		if j not in iDict:
			numID = len(iDict) + 1000
			iDict[j] = numID
	return iDict

def getDescription(l):
	a = len(l)
	for index, i in enumerate(l):
		if(index == (a-1)):
			print i
		elif (index == 0 or index == (a-2)):
			print i,
		else:
			print i + "," ,

def getQuality(d, ct):
	quality =[]
	quality.append("insert into Quality values (")
	quality.append(courseIDs[ct])
	quality.append(courseYears[ct])
	quality.append(courseSems[ct])
	quality.append(courseSections[ct])
	quality_idx = [10, 14, 18, 22, 26, 30]
	a_idx = [38, 42, 43, 44]
	for i in quality_idx:
		quality.append(d[i-1].rstrip())
	quality.append(");")
	getDescription(quality)
	return getAggregateInfo(d,ct,a_idx,"Quality")


def getTeachingEffectiveness(d, ct):
	te = []
	te.append("insert into TeachingEffectiveness values (")
	te.append(courseIDs[ct])
	te.append(courseYears[ct])
	te.append(courseSems[ct])
	te.append(courseSections[ct])
	te_idx = [55, 59, 63, 67, 71, 75] 
	a_idx = [83, 87, 88, 89]
	for i in te_idx:
		te.append(d[i-1].rstrip())
	te.append(");")
	getDescription(te)
	return getAggregateInfo(d,ct,a_idx,"TeachingEffectiveness")

def getIntChallenge(d, ct):
	te = []
	te.append("insert into IntChallenge values (")
	te.append(courseIDs[ct])
	te.append(courseYears[ct])
	te.append(courseSems[ct])
	te.append(courseSections[ct])
	te_idx = [99, 103, 107, 111, 115, 119]
	a_idx =[127, 131, 132, 133]
	for i in te_idx:
		te.append(d[i-1].rstrip())
	te.append(");")
	getDescription(te)
	return getAggregateInfo(d,ct,a_idx,"IntlChallenge")

def getFeedback(d, ct):
	quality =[]
	quality.append("insert into WorkFeedback values (")
	quality.append(courseIDs[ct])
	quality.append(courseYears[ct])
	quality.append(courseSems[ct])
	quality.append(courseSections[ct])
	quality_idx = [10, 14, 18, 22, 26, 30] 
	a_idx = [38, 42, 43, 44]
	for i in quality_idx:
		quality.append(d[i-1].rstrip())
	quality.append(");")
	getDescription(quality)
	return getAggregateInfo(d,ct,a_idx,"Feedback")

def getWorkload(d, ct):
	quality =[]
	quality.append("insert into Workload values (")
	quality.append(courseIDs[ct])
	quality.append(courseYears[ct])
	quality.append(courseSems[ct])
	quality.append(courseSections[ct])
	quality_idx = [55,59,63,67,71,75]
	a_idx = [83,87,88,89]
	for i in quality_idx:
		quality.append(d[i-1].rstrip())
	quality.append(");")
	getDescription(quality)
	return getAggregateInfo(d,ct,a_idx,"Workload")

#use aggregateinfo method in each section, store in var, and print it
def getAggregateInfo(d, ct, agg_idx, sectionType):
	agg = []
	agg.append("insert into AggregateInfo values (")
	agg.append(courseIDs[ct])
	agg.append(courseYears[ct])
	agg.append(courseSems[ct])
	agg.append(courseSections[ct])
	for i in agg_idx:
		agg.append(d[i-1].rstrip())
	agg.append('"' + sectionType + '"')
	agg.append(");")
	num = agg[5].split('/')
	agg[5] = float(num[0])/int(num[1])
	agg[5] = "%.2f" % round(agg[5],2)
	return agg

def getCourseDetail(d, ct, cDetailDict):
	cDetail = ["insert into CourseDetail values (", courseIDs[ct], '"' + d[138].split(":")[1].rstrip()[1:] + '"', courseSchools[ct], courseDpts[ct], courseNums[ct], ");"]
	if cDetail[1] not in cDetailDict:
		cDetailDict[cDetail[1]] = 1
		getDescription(cDetail)

def getEnrollment(d):
	return d[37].rstrip().split('/')[1]

def getCourseInfo(d, ct):
	cInfo = ["insert into CourseInfo values (", courseIDs[ct], courseYears[ct], courseSems[ct], str(instructorIDs[courseInstructorN[ct]]), getEnrollment(d), courseSections[ct], ");"]
	getDescription(cInfo)

def getInstructor(name):
	fN = '"' + name.split()[0] + '"'  
	lN = '"' + name.split()[1] + '"' 
	inst = ["insert into Instructor values(", str(instructorIDs[name]), fN, lN, iDept[name], ");"]
	getDescription(inst)

### main ###

'''

create a pdf file list 
create all text file needed

get all core course info 

do insert quality for all files
do inser teaching effectiveness for all files
...
'''

aggregateInfos = []
courseList = getCourseList("cList.txt")

### first page ###

count = 0
courseTexts = []
while count < len(courseList):
	getText(courseList[count], count) #create .txt file
	courseTexts.append(getData(count)) #add to courseText master list
	count += 1

courseIDs, courseYears, courseSems, courseInstructorN, courseSections, courseSchools, courseDpts, courseNums, iDept = getCourseInformation(courseList)

instructorIDs = getInstructorIDs() #dictionary of instructorName:ID


# ### third page ###
count = 0
courseTexts2 = []
while count < len(courseList):
	getText2(courseList[count],count) #create .txt file for 3rd page
	courseTexts2.append(getData(count)) #add to courseText2 master list
	count += 1

# ### print instructor ###
for i in instructorIDs: # i is name
	getInstructor(i)



# ### print course info ###
count = 0
while count < len(courseList):
	getCourseInfo(courseTexts[count], count)
	count += 1


# ### print course detail ###
count = 0
cDetailDict = {}
while count < len(courseList):
	getCourseDetail(courseTexts[count], count, cDetailDict)
	count += 1


### do insert ###
count = 0
while count < len(courseList):
	aggregateInfos.append(getQuality(courseTexts[count], count))
	count += 1
print '\n'
count = 0
while count < len(courseList):
	aggregateInfos.append(getTeachingEffectiveness(courseTexts[count], count))
	count += 1
print '\n'
count = 0
while count < len(courseList):
	aggregateInfos.append(getIntChallenge(courseTexts[count], count))
	count += 1
print '\n'

# ### do insert ###
count = 0
while count < len(courseList):
	aggregateInfos.append(getFeedback(courseTexts2[count], count))
	count += 1
print '\n'
count = 0
while count < len(courseList):
	aggregateInfos.append(getWorkload(courseTexts2[count], count))
	count += 1
print '\n'

# ### print aggregate Info ###
for i in aggregateInfos:
 	getDescription(i)


