
source activate gan 

for layers in  0-6 1-5 1,2,3,5 0-9; do
for fixed_id in {0..4}; do
for trunc in 1; do

output_dir=/scratch/hdd001/home/wangkuan/stylegan/celeba-aux/attackz-$1/Mar24-s${layers}-t${trunc}-id${fixed_id}

cmd="attackz.py \
	--outdir ${output_dir} \
	--network /scratch/hdd001/home/wangkuan/stylegan/celeba-aux/Mar22-auto/00001-celeba-aux-auto2-resumefromprev/network-snapshot-002298.pkl \
	--trunc ${trunc} \
	--fixed_id ${fixed_id} \
	--layers ${layers}
"

if [ $1 == 0 ] 
then
python $cmd
break 100
else
sbatch <<< \
"#!/bin/bash
#SBATCH --mem=64G
#SBATCH -c 4
#SBATCH --gres=gpu:1
#SBATCH -p rtx6000
#SBATCH --time=200:00:00
#SBATCH --output=logs/train_gan-%j-out.txt
#SBATCH --error=logs/train_gan-%j-err.txt
#SBATCH --qos=normal

#necessary env
source activate gan

echo $cmd
python $cmd
"
fi

done
done
done
done
done
done
done
done


