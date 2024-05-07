#!/bin/bash

echo

echo "Создание текстовых файлов для проверки: text1.txt и c наполнением, text3.txt - пустой."
touch text1.txt
echo -e "Hello!
My name - Kate. It is good?
I love you.
1999, but not 1999. It is good year.
My nomber 89079229843?
Anton have nomber 89096650414.
!@#$%^&*()_+..." > text1.txt 

echo "1. Проверка одиночных флагов. Ввод после вызова утилиты:"
echo
echo "-e "!@#" text1.txt"
./s21_grep -e "!@#" text1.txt > outputS21.txt
grep -e "!@#" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-i "anton" text1.txt"
./s21_grep -i "Anton" text1.txt > outputS21.txt
grep -i "anton" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-v "is" text1.txt"
./s21_grep -v "is" text1.txt > outputS21.txt
grep -v "is" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-c "My" text1.txt"
./s21_grep -c "My" text1.txt > outputS21.txt
grep -c "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-l "1999, but not 1999." text1.txt"
./s21_grep -l "1999, but not 1999." text1.txt > outputS21.txt
grep -l "1999, but not 1999." text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-n "?" text1.txt"
./s21_grep -n "?" text1.txt > outputS21.txt
grep -n "?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-h "nomber" text1.txt"
./s21_grep -h "nomber" text1.txt > outputS21.txt
grep -h "nomber" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-s "A" text1.tx"
./s21_grep -s "A" text1.tx > outputS21.txt
grep -s "A" text1.tx > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-o "o" text1.txt"
./s21_grep -o "o" text1.txt > outputS21.txt
grep -o "o" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "2. Тесты на парные комбинации флагов"
echo
echo "-e блок тестов, когда 'e' впереди"
echo
echo "-ei "My" text1.txt"
./s21_grep -ei "My" text1.txt > outputS21.txt
grep -ei "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ev "My" text1.txt"
./s21_grep -ev "My" text1.txt > outputS21.txt
grep -ev "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ec "My" text1.txt"
./s21_grep -ec "My" text1.txt > outputS21.txt
grep -ec "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-el "My" text1.txt"
./s21_grep -el "My" text1.txt > outputS21.txt
grep -el "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-en "My" text1.txt"
./s21_grep -en "My" text1.txt > outputS21.txt
grep -en "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-eh "My" text1.txt"
./s21_grep -eh "My" text1.txt > outputS21.txt
grep -eh "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-es "My" text.txt"
./s21_grep -es "My" text.txt > outputS21.txt
grep -es "My" text.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-eo "My" text1.txt"
./s21_grep -eo "My" text1.txt > outputS21.txt
grep -eo "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-e блок тестов, когда 'e' - второй флаг"
echo
echo "-ie "m" text1.txt"
./s21_grep -ei "m" text1.txt > outputS21.txt
grep -ei "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ve "is" text1.txt"
./s21_grep -ve "?" text1.txt > outputS21.txt
grep -ve "?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ce "9" text1.txt"
./s21_grep -ce "9" text1.txt > outputS21.txt
grep -ce "9" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-le "c?" text1.txt"
./s21_grep -le "c?" text1.txt > outputS21.txt
grep -le "c?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ne "is" text1.txt"
./s21_grep -ne "is" text1.txt > outputS21.txt
grep -ne "is" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-he "on" text1.txt"
./s21_grep -he "on" text1.txt > outputS21.txt
grep -he "on" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-se "My" text1.tx"
./s21_grep -se "My" text1.tx > outputS21.txt
grep -se "My" text1.tx > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-oe "o" text1.txt"
./s21_grep -oe "o" text1.txt > outputS21.txt
grep -oe "o" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-i блок тестов (iv, ic, il, in, ih, is, io)"
echo
echo "-iv "m" text1.txt"
./s21_grep -iv "m" text1.txt > outputS21.txt
grep -iv "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ic "m" text1.txt"
./s21_grep -ic "m" text1.txt > outputS21.txt
grep -ic "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-il "m" text1.txt"
./s21_grep -il "m" text1.txt > outputS21.txt
grep -il "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-in "m" text1.txt"
./s21_grep -in "m" text1.txt > outputS21.txt
grep -in "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ih "m" text1.txt"
./s21_grep -ih "m" text1.txt > outputS21.txt
grep -ih "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-is "m" tex1.txt"
./s21_grep -is "m" text1.txt > outputS21.txt
grep -is "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-io "m" text1.txt"
./s21_grep -io "m" text1.txt > outputS21.txt
grep -io "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-v блок тестов (vc, vl, vn, vh, vs, vo)"
echo
echo "-vc "?" text1.txt"
./s21_grep -vc "?" text1.txt > outputS21.txt
grep -vc "?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-vl "Pavel" text1.txt"
./s21_grep -vl "Pavel" text1.txt > outputS21.txt
grep -vl "Pavel" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-vn "My" text1.txt"
./s21_grep -vn "My" text1.txt > outputS21.txt
grep -vn "My" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-vh "is" text1.txt"
./s21_grep -vh "is" text1.txt > outputS21.txt
grep -vh "is" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-vs "Anton" text1.tx"
./s21_grep -vs "Anton" text1.tx > outputS21.txt
grep -vs "Anton" text1.tx > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-vo "m" text1.txt"
./s21_grep -vo "m" text1.txt > outputS21.txt
grep -vo "m" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-c блок тестов (cl, cn, ch, cs, co)"
echo
echo "-cl "?" text1.txt"
./s21_grep -cl "?" text1.txt > outputS21.txt
grep -cl "?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-cn "." text1.txt"
./s21_grep -cn "." text1.txt > outputS21.txt
grep -cn "." text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ch "90" text1.txt"
./s21_grep -ch "90" text1.txt > outputS21.txt
grep -ch "90" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-cs "My" text.txt"
./s21_grep -cs "My" text.txt > outputS21.txt
grep -cs "My" text.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-co "to" text1.txt"
./s21_grep -co "to" text1.txt > outputS21.txt
grep -co "to" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-l блок тестов (ln, lh, ls, lo)"
echo
echo "-ln "c?" text1.txt"
./s21_grep -ln "c?" text1.txt > outputS21.txt
grep -ln "c?" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-lh "Pavel" text1.txt"
./s21_grep -lh "Pavel" text1.txt > outputS21.txt
grep -lh "Pavel" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ls "Anton" text1.t"
./s21_grep -ls "Anton" text1.t > outputS21.txt
grep -ls "Anton" text1.t > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-lo "o" text1.txt"
./s21_grep -lo "o" text1.txt > outputS21.txt
grep -lo "o" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-n блок тестов (nh, ns, no)"
echo
echo "-nh "A" text1.txt"
./s21_grep -nh "A" text1.txt > outputS21.txt
grep -nh "A" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ns "A" text.txt"
./s21_grep -ns "A" text.txt > outputS21.txt
grep -ns "A" text.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-no "a" text1.txt"
./s21_grep -no "a" text1.txt > outputS21.txt
grep -no "a" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-h блок тестов (hs, ho)"
echo
echo "-hs "A" text.txt"
./s21_grep -hs "A" text.txt > outputS21.txt
grep -hs "A" text.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-ho "a" text1.txt"
./s21_grep -ho "a" text1.txt > outputS21.txt
grep -ho "a" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi
echo
echo "-so "a" text1.txt"
./s21_grep -so "a" text1.txt > outputS21.txt
grep -so "a" text1.txt > outputGrep.txt
diff outputS21.txt outputGrep.txt
if [ $? -eq 0 ]; then
    echo "    Успешно"
else
    echo "    Ошибка"
fi

rm *.txt