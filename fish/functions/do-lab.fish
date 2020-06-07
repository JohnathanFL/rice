function do-lab
  git init
  git checkout -b $argv[1]
  git add .
  git commit -m $argv[1]
  git remote add origin https://github.com/JohnathanFL/365-Mobile
  git push -u origin $argv[1]
end
