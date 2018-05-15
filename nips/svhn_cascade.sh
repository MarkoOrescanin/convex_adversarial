if [ "${1}" != "" ] && [ "${2}" != "" ]; then
     directory=`basename $0 .sh`
     prefix="nips/${directory}"

     mkdir -p $prefix

     python examples/svhn.py --prefix ${prefix}/svhn \
                              --cascade 10 \
                              --l1_proj 50 \
                              --l1_train median \
                              --epsilon ${2} \
                              --starting_epsilon 0.001 \
                              --epochs 100 \
                              --batch_size 50 \
                              --schedule_length 20 \
                              --verbose 200 \
                              --cuda_ids ${1}
else
    echo "Error: need to pass in GPU ids and epsilon to run script."
fi
