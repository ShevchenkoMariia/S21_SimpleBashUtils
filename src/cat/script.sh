#!/bin/bash

echo
echo "1. Проверка с пустым файлом empty.txt"
touch empty.txt
./s21_cat empty.txt > s21_cat_output.txt
cat empty.txt > cat_output.txt
diff s21_cat_output.txt cat_output.txt
if [ $? -eq 0 ]; then
    echo "  Успешно"
else
    echo "  Ошибка"
fi

echo

echo "2. Проверка с несуществующим файлом"
./s21_cat non_file.txt 2> s21_cat_error.txt
cat non_file.txt 2> cat_error.txt
awk -F: '{print $2, $3}' s21_cat_error.txt > s21_cat_error_part.txt
awk -F: '{print $2, $3}' cat_error.txt > cat_error_part.txt
diff s21_cat_error_part.txt cat_error_part.txt
if [ $? -eq 0 ]; then
    echo "  Успешно"
else 
    echo "  Ошибка"
fi

echo

echo -e "Hello, my dear!\nThis is a test file with various types of data:\n
1. Text: \"Some text here\"\n2. Numbers: 34567890
3. Special characters: !@#$%^&*()_+-={}[]|\:;\"\'<>,.?/~\`\n
Пока-пока..." > b.txt 

echo "3. Проверка флага -b на b.txt(нумерация только не пустых строк)"
./s21_cat -b b.txt > s21_cat_b.txt
cat -b b.txt > cat_b.txt
diff cat_b.txt s21_cat_b.txt 
if [ $? -eq 0 ]; then
    echo "  -b Успешно"
else 
    echo "  -b Ошибка"
fi

echo 

echo "4. Проверка флага --number-nonblank на b.txt(нумерация только не пустых строк)"
./s21_cat --number-nonblank b.txt > s21_cat_b.txt
cat --number-nonblank b.txt > cat_b.txt
diff s21_cat_b.txt cat_b.txt
if [ $? -eq 0 ]; then
    echo "  --number-nonblank Успешно"
else 
    echo "  --number-nonblank Ошибка"
fi

echo -e "Hello, my dear!\n\nNumbers: 34567890
\t3. Special characters: !@#$%^&*()_+-={}[]|\:;\"\'<>,.?/~\`\n
Пока-пока..." > e.txt 

echo

echo "5. Проверка флага -e на e.txt($ в конце строки)"
./s21_cat -e e.txt > s21_cat_e.txt
cat -e e.txt > cat_e.txt
diff s21_cat_e.txt cat_e.txt
if [ $? -eq 0 ]; then
    echo "  -e Успешно"
else 
    echo "  -e Ошибка"
fi

echo 

echo "6. Проверка флага -E на e.txt($ в конце строки)"
./s21_cat -E e.txt > s21_cat_e.txt
cat -E e.txt > cat_e.txt
diff s21_cat_e.txt cat_e.txt
if [ $? -eq 0 ]; then
    echo "  -E Успешно"
else 
    echo "  -E Ошибка"
fi

echo

echo -e "Hello, my dear!\n\nNumbers: 34567890
\t3. Special characters: !@#$%^&*()_+-={}[]|\:;\"\'<>,.?/~\`\n
Пока-пока..." > n.txt 

echo "7. Проверка флага -n на n.txt(нумерация всех строк)"
./s21_cat -n n.txt > s21_cat_n.txt
cat -n n.txt > cat_n.txt
diff s21_cat_n.txt cat_n.txt
if [ $? -eq 0 ]; then
    echo "  -E Успешно"
else 
    echo "  -E Ошибка"
fi

echo

echo "8. Проверка флага --number на n.txt(нумерация всех строк)"
./s21_cat --number n.txt > s21_cat_n.txt
cat --number n.txt > cat_n.txt
diff s21_cat_n.txt cat_n.txt
if [ $? -eq 0 ]; then
    echo "  -E Успешно"
else 
    echo "  -E Ошибка"
fi

echo $?

echo

echo -e "Hello, my dear!\nHello, my dear!\nThis is a test file with various types of data:\n
1. Text: \"Some text here\"\n2. Numbers: 34567890
3. Special characters: !@#$%^&*()_+-={}[]|\:;\"\'<>,.?/~\`\n
Пока-пока..." > s.txt 

echo "9. Проверка флага -s на s.txt(сжимает смежные строки)"
./s21_cat -s s.txt > s21_cat_s.txt
cat -s s.txt > cat_s.txt
diff s21_cat_s.txt cat_s.txt
if [ $? -eq 0 ]; then
    echo "  -E Успешно"
else 
    echo "  -E Ошибка"
fi

echo

echo "10. Проверка флага --squeeze-blank на s.txt(нумерация всех строк)"
./s21_cat --squeeze-blank s.txt > s21_cat_s.txt
cat --squeeze-blank s.txt > cat_s.txt
diff s21_cat_s.txt cat_s.txt
if [ $? -eq 0 ]; then
    echo "  -E Успешно"
else 
    echo "  -E Ошибка"
fi

echo

rm *.txt
echo




