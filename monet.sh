IMAGE=$1
if [ -z "$IMAGE" ]; then
    echo "IMAGE is empty, defaulting to content.jpg"
    IMAGE="content.jpg"
fi

STYLE=$2

if [ -z "$STYLE" ]; then
    echo "STYLE is empty, defaulting to all"

for i in $(seq 0 1 9);
  do
   echo "Generating monet_styles $i on $IMAGE"
   image_stylization_transform \
      --num_styles=10 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-monet.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$i:1}" \
      --output_dir="out_""$IMAGE" \
      --output_basename="monet_styles"
   echo "done for style $i"
  done
else
  echo "Generating monet_styles $STYLE on $IMAGE"
  image_stylization_transform \
      --num_styles=10 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-monet.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$STYLE:1}" \
      --output_dir="out_""$IMAGE" \
      --output_basename="monet_styles"
  echo "done for style $STYLE"

fi
