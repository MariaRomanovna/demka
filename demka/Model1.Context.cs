﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace demka
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Model1Container : DbContext
    {
        private static Model1Container _context;
        public Model1Container()
            : base("name=Model1Container")
        {
        }
    public static Model1Container GetContext()
        {
            if (_context == null)
                _context = new Model1Container();
            return _context;
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<User> UserSet { get; set; }
        public virtual DbSet<Prepod> PrepodSet { get; set; }
        public virtual DbSet<Student> StudentSet { get; set; }
        public virtual DbSet<Admin> AdminSet { get; set; }
        public virtual DbSet<Mark> MarkSet { get; set; }
        public virtual DbSet<Subject> SubjectSet { get; set; }
        public virtual DbSet<Progress> ProgressSet { get; set; }
    }
}