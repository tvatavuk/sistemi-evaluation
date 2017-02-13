using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SistemiEvaluation.Models;
using SistemiEvaluation.Data;
using SistemiEvaluation.Data.Repositories;
using SistemiEvaluation.Data.Abstract;
using SistemiEvaluation.Entities;
using SEB.Data.Repositories;

namespace SistemiEvaluation.Data.Repositories
{
    public class ContentRepository : EntityBaseRepository<Content>, IContentRepository
    {
        public ContentRepository(SistemiEvaluationDBContext context):base(context) { }


    }
}
