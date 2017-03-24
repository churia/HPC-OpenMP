import matplotlib
import matplotlib.pylab as plt
import numpy as np
import sys

font = {'family' : 'normal',
        'weight' : 'bold',
        'size'   : 16}

matplotlib.rc('font', **font)
matplotlib.rc('text', usetex=True)
matplotlib.rcParams['text.latex.preamble']=[r"\usepackage{amsmath}"]

f=open(sys.argv[1])
lines=f.readlines()
f.close()

Jiters=[]
JRs=[]
for line in lines:
	if "Residual" in line:
		strs=line.strip().split()
		JRs.append(float(strs[strs.index('Residual')+1]))
		Jiters.append(float(strs[strs.index('Iter')+1]))

f=open(sys.argv[2])
lines=f.readlines()
f.close()

Giters=[]
GRs=[]
for line in lines:
	if "Residual" in line:
		strs=line.strip().split()
		GRs.append(float(strs[strs.index('Residual')+1]))
		Giters.append(float(strs[strs.index('Iter')+1]))

f=open(sys.argv[3])
lines=f.readlines()
f.close()

Piters=[]
PRs=[]
for line in lines:
	if "Residual" in line:
		strs=line.strip().split()
		PRs.append(float(strs[strs.index('Residual')+1]))
		Piters.append(float(strs[strs.index('Iter')+1]))

xJ=np.array(Jiters)
xG=np.array(Giters)
xP=np.array(Piters)
print xJ.size
JRs=np.array(JRs)
GRs=np.array(GRs)
PRs=np.array(PRs)

'''
J,=plt.plot(xJ,JRs,'b',linewidth=2.4)
G,=plt.plot(xG,GRs,'--',linewidth=2.4)
P,=plt.plot(xP,PRs,'g',linewidth=2.4)
plt.xlim([0,100000])
plt.ylabel('$\\left\\lVert A\\boldsymbol{u}^k-\\boldsymbol{f}\\right\\rVert$')

'''
JRs=JRs/JRs[0]
GRs=GRs/GRs[0]
PRs=PRs/PRs[0]
J,=plt.semilogy(xJ, JRs, 'b', linewidth=2.4)
G,=plt.semilogy(xG, GRs, '--',linewidth=2.4)
P,=plt.semilogy(xP, PRs, 'g',linewidth=2.4)
plt.ylabel('$\\left\\lVert A\\boldsymbol{u}^k-\\boldsymbol{f}\\right\\rVert/\\left\\lVert A\\boldsymbol{u}^0-\\boldsymbol{f}\\right\\rVert$')
plt.ylim([0.0001,1])


plt.xlabel('\\#iterations')
plt.legend([J, G, P], ['Jacobi', 'GS-red/black','GS-serial'])

plt.savefig('cg_500.eps',format='eps', dpi=1000)
#plt.savefig('ri500.eps',format='eps', dpi=1000)
#plt.show()