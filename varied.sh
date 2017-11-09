IMAGE=$1
if [ -z "$IMAGE" ]; then
    echo "IMAGE is empty, defaulting to content.jpg"
    IMAGE="content.jpg"
fi

mkdir -p out

for i in $(seq 0 1 31);
do
  image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-varied.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$i:1}" \
      --output_dir=out \
      --output_basename="varied_styles"
done
