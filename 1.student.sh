clear
while [ 1 ]
do
echo -ne "1.Create  2.Dispaly  3.Insert  4.Search  5.Modify  6.Delete  7.Exit\n"

echo -e "Enter Choice=\c"
read ch
case $ch in
1)  
   echo -n "Enter File name:"
   read fname
   if [ -e $fname ]
	    then
   	echo "File Already Exists"
  else
        >> $fname
  echo "File Createated Successfully"
fi
;;
2)
   echo -n "Enter File Name:"
   read fname
   if [ -e $fname ]
 then
    echo "The Content Of File:"
    sort -n $fname
else
    echo "File Not Exists"
fi     
;;
3) 
  echo -n "Enter The File Name:"
  read fname
  if [ -e $fname ]
  then 
    echo -n "Enter The Roll Number:"
    read roll 
   grep -w "$roll" $fname
    ans=$?
   if [ $ans -eq 0 ]
   then
   echo "Record Already Present "
 else
    echo -n "Enter Name:"
    read  name
    echo $roll $name >> $fname 
    echo "Record Inserted Successfully"
fi
else
   echo "File Not Exists"
fi
;;
4)
  echo -n "Enter The File Name:"
  read fname
  if [ -e $fname ]
  then
  echo -n "Enter The Roll Number:"
  read roll
  grep -w "$roll" $fname
  ans=$?
  if [ $ans -eq 0 ]
  then 
   echo "Record Found"
 else
   echo "Record Not Found"
fi
else
echo "File Not Exists"
fi
;;
5)
  echo -n "Enter The File Name:"
  read fname
  if [ -e $fname ]
  then
  echo -n "Enter The Roll Number:"
  read roll
  grep -w "$roll" $fname
  ans=$?
  if [ $ans -eq 0 ]
  then 
   echo -n "Enter NewRoll And NewName:"
   read nroll nname
   grep -w "$nroll" $fname
   ans=$?
   if [ $ans -eq 0 ]
   then
     echo Record already present please try another roll no
   else 
   grep -v "$roll" $fname >> temp
   echo "$nroll $nname" >> temp
   rm $fname
   cp temp $fname
   rm temp
   echo "Record Successfully Modified"
   fi
else
  echo "Record Not Present"
fi
else
  echo "File Not Exists"
fi
;;
6)
echo -n "Enter The File Name:"
  read fname
  if [ -e $fname ]
  then
  echo -n "Enter The Roll Number:"
  read roll
  grep -w "$roll" $fname
  ans=$?
  if [ $ans -eq 0 ]
  then
   grep -v "$roll" $fname >> temp
   rm $fname
   cp temp $fname
   rm temp
  echo "Record Successfully Deleted"
  else
   echo "Record doesn't found"
fi
else
 echo "File Not Exists"
fi
;; 
7) exit
	
	;;
*) echo "Your Choice Not Correct"
;;

esac
done


