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

Jiters=0
JRs=[]
for line in lines:
	if "Residual" in line:
		Jiters+=1
		strs=line.strip().split()
		JRs.append(float(strs[strs.index('Residual')+1]))

f=open(sys.argv[2])
lines=f.readlines()
f.close()

Giters=0
GRs=[]
for line in lines:
	if "Residual" in line:
		Giters+=1
		strs=line.strip().split()
		GRs.append(float(strs[strs.index('Residual')+1]))


xJ=np.linspace(1,Jiters,Jiters)
xG=np.linspace(1,Giters,Giters)
print xJ.size
JRs=np.array(JRs)
GRs=np.array(GRs)

J,=plt.plot(xJ,JRs,'b',linewidth=2.4)
G,=plt.plot(xG,GRs,'--',linewidth=2.4)
plt.xlim([0,1000])
plt.ylabel('$\\left\\lVert A\\boldsymbol{u}^k-\\boldsymbol{f}\\right\\rVert$')

'''
JRs=JRs/JRs[0]
GRs=GRs/GRs[0]
J,=plt.semilogy(xJ, JRs, 'b', linewidth=2.4)
G,=plt.semilogy(xG, GRs, '--',linewidth=2.4)
plt.ylabel('$\\left\\lVert A\\boldsymbol{u}^k-\\boldsymbol{f}\\right\\rVert/\\left\\lVert A\\boldsymbol{u}^0-\\boldsymbol{f}\\right\\rVert$')
plt.ylim([0.0001,1])
'''

plt.xlabel('\\#iterations')
plt.legend([J, G], ['Jacobi', 'Gauss-Seidel'])

#plt.savefig('cg_0.eps',format='eps', dpi=1000)
#plt.savefig('ri24.png')#,format='eps', dpi=1000)
plt.show()