#!/bin/bash

## (1) segment
## (2) preProcessing
#python bin/random_.py data/video.query.delFilm.seg > data/video.query.delFilm.seg.shuffle
head -1500000 data/video.query.delFilm.seg.shuffle > data/video.query.delFilm.seg.shuffle.150w
cat data/video.query.delFilm.seg.shuffle.150w data/web.novideo.query.seg.shuffle | python bin/vocab.py > data/vocab.dat 
cat data/video.query.delFilm.seg.shuffle.150w | awk '{print "1	"$0}' > tmp/all.video
cat data/web.novideo.query.seg.shuffle | awk '{print "0	"$0}' >> tmp/all.video
python bin/random_.py tmp/all.video > x
mv x tmp/all.video
cat data/video.query.delFilm.seg.shuffle.150w data/web.novideo.query.seg.shuffle > tmp/total.seg
cat data/video.query.delFilm.seg.shuffle.150w | python bin/makeTrain.py > tmp/video.query.delFilm.seg.train
cat data/web.novideo.query.seg.shuffle | python bin/makeTrain.py > tmp/web.novideo.query.seg.train
## (3) w2v
## postProcessing 
# cat data/video.vectors.bin | perl data/replaceSpace.pl > x
# mv x data/video.vectors.bin

## (4) train
# python bin/traintest1.sam.py > log.txt
