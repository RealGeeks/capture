GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

rm -rf molly-variations/*.png;
printf "Cleaned ${GREEN}molly-variations/\n\n${NORMAL}";

for name in $(ls palettes/molly/*.scss | cut -f3 -d/ | cut -f1 -d.);
do 
  sed "s/syzygy/palettes\/molly\/${name}/g" molly.scss > temp.scss;
  sass temp.scss molly.css;
  phantomjs-2.0.0-macosx/bin/phantomjs capture.js molly.html molly-variations/${name}.png;
  rm temp.scss;
  printf "Captured ${name}\n";
done

printf "\n\n\a${GREEN}Done.\n\n${NORMAL}Created Molly variations in ${GREEN}molly-variations/ \n\n"; 
