using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace demka
{
    /// <summary>
    /// Логика взаимодействия для MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void OpenSubject_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OpenProfile_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OpenProgress_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OpenStudenList_Click(object sender, RoutedEventArgs e)
        {
            StudentList stud = new StudentList();
            stud.Show();
            this.Hide();
        }
    }
}
