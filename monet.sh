IMAGE=$1
if [ -z "$IMAGE" ]; then
    echo "IMAGE is empty, defaulting to content.jpg"
    IMAGE="content.jpg"
fi

mkdir -p out

for i in $(seq 0 1 9);
do
  image_stylization_transform \
      --num_styles=10 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-monet.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$i:1}" \
      --output_dir=out \
      --output_basename="monet_styles"
done

