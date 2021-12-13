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
    /// Логика взаимодействия для avtorize.xaml
    /// </summary>
    public partial class avtorize : Window
    {
        public avtorize()
        {
            InitializeComponent();
        }

        private void reg_click(object sender, RoutedEventArgs e)
        {
            MainWindow m = new MainWindow();
            m.Show();
            this.Hide();
        }

        private void spravka_click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Проект разработан сверхразумом");
        }

        private void auth_click(object sender, RoutedEventArgs e)
        {
            string loginn = login.Text;
            if (loginn.Length <= 5)
            {
                MessageBox.Show("Длина логина должна быть больше 5 символов!");
            }
            string password = pass.Text;
            if (password.Length <= 5)
            {
                MessageBox.Show("Длина пароля должна быть больше 5 символов!");
            }
            User NewUser = new User();
            NewUser = Model1Container.GetContext().UserSet.Where(b => b.Login == loginn && b.Password == password).FirstOrDefault();
            if (NewUser != null)
            {
                MessageBox.Show("Вы успешно авторизовались!");
            }
            else
            {
                MessageBox.Show("Такого пользователя не существует!");
            }
        }
    }
}
