rm -r releases/*
electron-packager . countdown --app-version $1 --arch ia32,x64 --platform win32,linux,darwin --asar --overwrite --out releases
cd releases
echo "Zipping..."
for file in countdown-win32-*
do
echo "$file -> $file.zip"
zip -qr "$file.zip" $file
done
for file in countdown-linux-*
do
echo "$file -> $file.tar.gz"
tar czf "$file.tar.gz" $file
done
for file in countdown-darwin-*
do
echo "$file -> $file.tar.gz"
tar czf "$file.tar.gz" $file
done
cd ..
