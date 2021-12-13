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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace demka
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void photo_click(object sender, RoutedEventArgs e)
        {
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();

            dlg.DefaultExt = ".png";
            dlg.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif)|*.gif";



            Nullable<bool> result = dlg.ShowDialog();


            // Get the selected file name and display in a TextBox 
            if (result == true)
            {
                // Open document 
                string filename = dlg.FileName;
                textbox1.Text = filename;
            }
        }


        private void auvto_click(object sender, RoutedEventArgs e)
        {
            avtorize a = new avtorize();
            a.Show();
            this.Hide();
        }

        private void reg_click(object sender, RoutedEventArgs e)
        {
            string fioo = fio.Text;
            if (fioo.Length <= 1)
            {
                MessageBox.Show("Заполните поле ФИО");
            }
            string numbergroup = number.Text;
            if (role.SelectedItem == student)
            {                
                if (numbergroup.Length <= 1)
                {
                    MessageBox.Show("Укажите номер группы!");
                }
            }
            else
            {
                string position = number.Text;
                if (position.Length <= 5)
                {
                    MessageBox.Show("Укажите должность!");
                }
            }
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

            User currentUser = new User();
            User prov = new User();
            Prepod currentPrepod = new Prepod();
            Student currentStudent = new Student();
           prov = Model1Container.GetContext().UserSet.Where(b => b.Login == loginn).FirstOrDefault();
            if (role.SelectedItem == student)
            {
                if (prov == null)
                {
                    currentUser.Login = loginn;
                    currentUser.Password = password;
                    currentUser.Role = "student";
                    Model1Container.GetContext().UserSet.Add(currentUser);
                }
                else
                {
                    MessageBox.Show("Такой логин уже существует");
                }

                if (role.SelectedItem == student)
                {
                    currentStudent.FIO = fioo;
                    currentStudent.NumberGroup = int.Parse(numbergroup);
                    currentStudent.Photo = textbox1.Text;
                    currentStudent.PersonalData = about.Text;
                    currentStudent.User = currentUser;
                    Model1Container.GetContext().StudentSet.Add(currentStudent);
                    MessageBox.Show("Пользователь зарегистрирован!");


                }
                else
                {
                    MessageBox.Show("Что-то пошло не так");
                }
            }
            else if (role.SelectedItem == professor)
            {
                if (prov == null)
                {
                    currentUser.Login = loginn;
                    currentUser.Password = password;
                    currentUser.Role = "преподаватель";
                    Model1Container.GetContext().UserSet.Add(currentUser);
                }
                else
                {
                    MessageBox.Show("Такой логин уже существует");
                }
                if (role.SelectedItem == professor)
                {
                    currentPrepod.FIO = fioo;
                    currentPrepod.Position = numbergroup;
                    currentPrepod.PersonalData = about.Text;
                    currentPrepod.Photo = textbox1.Text;
                    currentPrepod.User = currentUser;
                    Model1Container.GetContext().PrepodSet.Add(currentPrepod);
                    MessageBox.Show("Пользователь зарегистрирован!");
                    MenuWindow menu = new MenuWindow();
                    menu.Show();
                    this.Hide();

                }
                else
                {
                    MessageBox.Show("Что-то пошло не так");
                }
            }

            Model1Container.GetContext().SaveChanges();

        }
    
        private void professor_select(object sender, SelectionChangedEventArgs e)
        {
            if (role.SelectedItem == professor)
            {
                textBlockPosition.Text = "Должность";
            }
            else
            {
                textBlockPosition.Text = "Номер группы";
            }
        }
    }
}
