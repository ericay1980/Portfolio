select *
from covid_data.vaccinations
order by 1,2
;

select *
from covid_data.deaths
order by 1,2
;

Select location, dA, total_cases, new_cases, total_deaths, population
From covid_data.deaths
order by 1,2
;

/*Total Cases vs Total Deaths-Finding the percentage of deaths in South Korea vs United States*/

Select location, dA, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From covid_data.deaths
/*Where location like '%South Korea%'*/
order by 1,2
;

Select location, dA, total_cases, new_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From covid_data.deaths
/*Where location like '%States%'*/
order by 1,2
;

/*Total Cases vs Population-Finding the percentage of th population infected Us vs South Korea*/

Select location, dA, total_cases, new_cases, population, (total_cases/population)*100 as Percent_Popluation_Infected
From covid_data.deaths
/*Where location like '%States%'*/
order by 1,2 
;

Select location, dA, total_cases, new_cases, population, (total_cases/population)*100 as Percent_Popluation_Infected
From covid_data.deaths
/*Where location like '%South Korea%'*/
order by 1,2 
;

Select location, dA, total_cases, new_cases, population, (total_cases/population)*100 as Percent_Popluation_Infected
From covid_data.deaths
order by 1,2 
;
/*Countries with Highest Infections Rate Compared to Population*/

Select location, population, max(total_cases) as HighestIndfectionCount, max(total_cases/population)*100 as Population_Infection_Rate
From covid_data.deaths
Group by location, population
order by Population_Infection_Rate
;

/*Now showing countries with highest death count per population*/

Select location, max(total_deaths) as TotalDeathCount
From covid_data.deaths
Group by location
order by TotalDeathCount
;

/*Break down by Continent*/

Select continent, max(total_deaths) as TotalDeathCount
From covid_data.deaths
Group by continent
order by TotalDeathCount desc
;

/*Global Numbers*/

Select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, sum(new_deaths)/sum(new_cases)*100 as DeathPercentage
from covid_data.deaths
where continent is not null
order by 1,2
;

Select *
from covid_data.vaccinations dea
join  covid_data.vaccinations vac
on dea.location=vac.location
and dea.dA=vac.dA





















