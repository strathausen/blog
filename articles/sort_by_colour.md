title: 'Sort products by colour in web shops'
tags: [ bulk, colour, csv, import, magento, presta, prestashop, python, shop, sort, sorting, xt-commerce, xtcommerce ]
date: 'August 4th, 2010'
published: true


## Sorting products by colour in web shops

Many shop systems, like Magento, Prestashop or xt-commerce, lack the ability to automatically sort products by colour.

In order to solve this,
I wrote a little python script that transforms the average colour of a product
image into a scalar, then generates a CSV file including the colour value in
some property, allowing it to be sorted easily by the web shop system of your
choice.  Images with many different colours are not sorted very well, but it
worked for most of the products in my case.

You can see the script in action at
<a href="http://unikatstoff.de/9-einfarbige-stoffe-unicolor" target="_blank">unikatstoff.de</a>
(sorry, shop is offline right now).  It generates a
CVS file which can be imported by most e-commerce systems.  You will certainly
have to change the script to your needs, but this should be easy to do even
with little programming experience.  Changing the sorting mechanism may also be
appropriate in some cases.
Enjoy.

And here’s the script.  The product image names must contain numbers
functioning as the product ID and the files must reside in a folder structure
reflecting your category names Of course, you can change all that You will also
have to adopt the script to map the category names to product descriptions,
category ids or whatever your system requires in order to import the products.

``` python
from PIL import Image
from colorsys import rgb_to_hls
import sys
 
# calculating the average color
def average_hls(f):
    r, g, b = 0, 0, 0
    count = 0
    img = Image.open(f)
    data = img.load()
    # you may not need to count all the pixels of the image,
    # to enhance performance you could also just consider
    # every 100th pixel or so...
    for x in xrange(img.size[0]):
        for y in xrange(img.size[1]):
            tempr,tempg,tempb = data[x,y]
            r += tempr
            g += tempg
            b += tempb
            count += 1
    count *= 255
    (r, g, b) = (float(r)/count, float(g)/count, float(b)/count)
    # calculate averages, convert to hls
    return rgb_to_hls((r/count), (g/count), (b/count))
 
if __name__ == '__main__':
    categories = {
    # Folder name without trailing "/"
        './Category one/Sub category/Sub sub category' : {
            "categories" : "9,20",
            "short"      : "Unicolor; 100x70cm; ",
            "desc"       : "Description",
            "name"       : "Unicolor 180g",
        },
        './Category one/Sub category two' : {
            "categories" : "11,23",
            "short"      : "Multicolor; 100x80cm; 220g",
            "desc"       : "Detailed description",
            "name"       : "Multicolor 220g",
        },
    }
    for arg in sys.argv[1:]:
        try:
            (h, l, s) = average_hls(arg)
            entry = arg.rpartition('/')
# for sorting I use the HLS colour value along with the light value
# CVS table output is happening here
            print '"{id}"; "{h:03d}|{l:03d} {name}"; "{cat}"; 12;\
                "{article}"; "{short}"; "{desc}"; "../upload/{article}"'.format(
                id = int(entry[2].replace(".JPG", "").replace("d","")),
                h = int(h*255), l = int(l*10000000),
                a = arg,
                cat = categories[entry[0]]['categories'],
                article = entry[2],
                short = categories[entry[0]]["short"],
                desc = categories[entry[0]]["desc"],
                name = categories[entry[0]]["name"],
                )
        except IOError:
            pass
```

In Unix, you can use the script like this, in your folder containing the catalogue (sub-)folders and product images:

``` bash
find . -exec python ~/Path/To/AverageColor.py {} \; | \
  sort > import.csv
```

Enjoy a colourful database
