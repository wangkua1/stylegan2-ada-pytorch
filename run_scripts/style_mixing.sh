for styles in 1,2,3,5; do

python style_mixing.py --styles=${styles} --outdir=out-celeba/${styles} --rows=85,100,75,458,1500 --cols=55,821,1789,293  --network=/scratch/hdd001/home/wangkuan/stylegan/celeba-aux/Mar22-auto/00001-celeba-aux-auto2-resumefromprev/network-snapshot-002298.pkl

done