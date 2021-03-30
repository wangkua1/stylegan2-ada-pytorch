
source activate gan 

for cfg in auto auto8; do

output_dir=/scratch/hdd001/home/wangkuan/stylegan/celeba-aux/Mar22-${cfg}

cmd="train.py \
	--outdir ${output_dir} \
	--cfg ${cfg} \
	--data data/celeba-aux.zip \
	--gpus 2 \
	--snap 10 \
	--metrics fid50k_full \
	--resume_from_prev 1
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
#SBATCH --gres=gpu:2
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


