
cd test
perl test_list2venn.pl 
prove --formatter TAP::Formatter::JUnit test_list2venn.pl >  test_list2venn.UnitTest.xml
cd ..
