#!/bin/bash 

isPresent=1;
randomCheck=$(( RANDOM%2 ));
if [ $isPresent -eq $randomCheck ];
then
        echo "Employee is present";
else
        echo "Employee is absent":
fi

if [ $isPresent -eq $randomCheck ]
then
	empRatePerHr=20
	empHrs=8
	salary=$(($empHrs*$empRatePerHr))
else
	salary=0
fi

isPartTime=1
isFullTime=2
empRatePerHr=20
randomCheck=$(( RANDOM%3 ))

if [ $isPartTime -eq $randomCheck ]
then
	empHrs=4
	salary=$(($empHrs*$empRatePerHr))
elif [ $isFullTime -eq $randomCheck ]
then
	empHrs=8
	salary=$(($empHrs*$empRatePerHr))
else
	empHrs=0
fi

TotalWorkingDays=20
for (( day=1; day<=$TotalWorkingDays; day++ ))
do
	case $randomCheck in
		$isFullTime)empHrs=8 ;;
		$isPartTime)empHrs=4 ;;
		*)
		empHrs=0 ;;
	esac
	salary=$(($empHrs*$empRatePerHr))
	TotalSalary=$(( $TotalWorkingDays*$salary ))
done


WorkingHours=100
totalEmpHrs=0
totalWorkingDays=0
function getWorkingHours() {
        case $1 in
                $isPartTime)
                        empHrs=4
                        ;;
                $isFullTime)
                        empHrs=8
   			;;
                *)
                        empHrs=0
                        ;;
        esac
	echo $empHrs
}
function getDailyWages() {
        totalWorkHours=$1
        wages=$(( $totalWorkHours*$empRatePerHr ))
        echo $wages
}

while [[ $totalEmpHrs -lt $WorkingHours && $totalWorkingDays -lt $TotalWorkingDays ]]
do
        totalWorkingDays=$(($totalWorkingDays+1))
	empHrs=$(getWorkingHours $((RANDOM%3)) )
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
        DailyWages[$totalWorkingDays]="$( getDailyWages $empHrs )"
done
totalSalary="$( getDailyWages $totalEmpHrs )"
echo "daily wages:" ${DailyWages[@]}

