IMAGE=$1
if [ -z "$IMAGE" ]; then
    echo "IMAGE is empty, defaulting to content.jpg"
    IMAGE="content.jpg"
fi

STYLE=$2

if [ -z "$STYLE" ]; then
    echo "STYLE is empty, defaulting to all"

  for i in $(seq 0 1 31);
  do
    echo "Generating varied_styles $i on $IMAGE"
    image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-varied.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$i:1}" \
      --output_dir="out_""$IMAGE" \
      --output_basename="varied_styles"
    echo "done for style $i"
  done

else
  echo "Generating varied_styles $STYLE on $IMAGE"
  image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/magenta-models/multistyle-pastiche-generator-varied.ckpt \
      --input_image=$IMAGE \
      --which_styles="{$STYLE:1}" \
      --output_dir="out_""$IMAGE" \
      --output_basename="varied_styles"
  echo "done for style $STYLE"

fi
