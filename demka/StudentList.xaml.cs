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
    /// Логика взаимодействия для StudentList.xaml
    /// </summary>
    public partial class StudentList : Window
    {
        public StudentList()
        {
            InitializeComponent();
        }

        private void ShowStudent_Click(object sender, RoutedEventArgs e)
        {
            int numberTextBox = int.Parse(NGroup.Text);
            if (NGroup.Text.Length<=1)
            {
                MessageBox.Show("Введите номер группы!");
            }
            else
            {
                DGridStudent.ItemsSource = Model1Container.GetContext().StudentSet.Where(b => b.NumberGroup == numberTextBox).ToList();
            }
        }

        private void GoBack_Click(object sender, RoutedEventArgs e)
        {
            MenuWindow menu = new MenuWindow();
            menu.Show();
            this.Close();
        }
    }
}
