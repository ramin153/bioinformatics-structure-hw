from matplotlib import pyplot as plt
import matplotlib.image as mpimg

with open('phi_psi.txt') as f:
   input_string = f.read()

angle = list(map( lambda s: s.replace("{", "").strip().split(' '),input_string.split('}')))[:-1]



background_image = mpimg.imread('ram.jpg')
plt.imshow(background_image, extent=[-180, 180,-180, 180])

for i in angle:
   plt.plot(float(i[0]),float(i[1]),'co',alpha=0.7)
plt.xlim(-180, 180)
plt.ylim(-180, 180)


plt.xlabel('phi')
plt.ylabel('psi')

plt.title('ramachandran ')
plt.legend()

plt.show()