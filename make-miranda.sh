GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)

rm -rf miranda-variations/*.png;
printf "Cleaned ${GREEN}miranda-variations/\n\n${NORMAL}";

for name in $(ls palettes/*.scss | cut -f2 -d/ | cut -f1 -d.);
do 
  sed "s/syzygy/palettes\/${name}/g" miranda.scss > temp.scss;
  sass temp.scss miranda.css;
  phantomjs-2.0.0-macosx/bin/phantomjs capture.js miranda.html miranda-variations/${name}.png;
  rm temp.scss;
  printf "Captured ${name}\n";
done

printf "\n\n\a${GREEN}Done.\n\n${NORMAL}Created Miranda variations in ${GREEN}miranda-variations/ \n\n";
